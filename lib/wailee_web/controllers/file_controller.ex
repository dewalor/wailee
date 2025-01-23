defmodule WaileeWeb.FileController do
  use WaileeWeb, :controller

  def serve_file(conn, %{"name" => name}) do
    IO.puts(name)
    file_path = case name do
      "department_of_peace" ->
        "https://drive.google.com/file/d/1O2ULTXG3Xbu8Afbe2vVXeGOxbW50a5L4/view?usp=drive_link"
      "just_waking_up" ->
        "https://drive.google.com/file/d/1K0wxmaHgRnmO2WmjX0ujYrfKelV4Hm7R/view?usp=drive_link"
      "running_working" ->
        "https://drive.google.com/file/d/1r6XRyL8eL-A0IRiRZXUqh1Qm2S0CgDDh/view?usp=drive_link"
        _ ->
        conn
        |> put_status(404)
        |> text("File not found")               # Handle the error appropriately
    end
    redirect(conn, external: file_path)
  end
end
