defmodule Wailee.Blog do
  alias Wailee.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:wailee, "priv/posts/**/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir]

  # The @posts variable is first defined by NimblePublisher.
  # Further modify it by sorting all posts by descending date.
  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  #use all_posts rather than @posts whereever possible to avoid making a complete copy of all posts
  def all_posts, do: @posts
  def all_tags, do: @tags

  defmodule NotFoundError, do: defexception [:message, plug_status: 404]

  def get_post_by_id!(id) do
    Enum.find(all_posts(), &(&1.id == id)) ||
      raise NotFoundError, "post with id=#{id} not found"
  end

  def get_posts_by_tag!(tag) do
    case Enum.filter(all_posts(), &(tag in &1.tags)) do
      [] -> raise NotFoundError, "posts with tag=#{tag} not found"
      posts -> posts
    end
  end
end
