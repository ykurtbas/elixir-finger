# Finger

Finger is a verification library to prove hommaannnnnness of a `user`.

Finger achieves this by showing pictures of N hands holding up random fingers and asking users to verify how many fingers am I holding up, which is a task our  machine friends suck at!

![alt text](readme/finger_verification_1.jpg "Example 1")
![alt text](readme/finger_verification_2.jpg "Example 2")

### Context and Demo

* More detailed blog [post](https://elxsy.com/blog/giving-the-finger-to-those-pesky-bots)
* You can see it in action [on the registration page for elxsy](https://elxsy.com/users/register) 

** Please do not sign up if you do not intend to pass the email verification :)

# Dependencies

This library requires the awesome [imagemagick](https://imagemagick.org/) software to be installed on your machine. It is not version dependant.

# Improvements

Lot's of imporevements to be made to the library itself. First elixir and hex package, please bare with me :)
- Maybe fetch the asset paths once rather than everytime?
- Error case improvements
- unit testing System.Cmd
- unit testing Docs

# Installation

1. Install from Hex

```elixir
def deps do
  [
    {:finger, "~> 0.1.0"}
  ]
end
```
2. Create an `action` to display the image

```elixir
defmodule Elxsy.TestController do
  use Elxsy, :controller
  ...

  def test(conn, _params) do
    ...
    render(conn, ....)
  end

  def finger(conn, _params) do
    {answer, image} = Finger.generate()
    # store the answer in session or somwhere else on the server side
    
    conn
    |> put_session(:fingers, answer) 
    |> put_resp_content_type("image/jpeg")
    |> send_resp(200, image)
  end

  def verify(conn, params) do
    answer = get_session(conn, :fingers)
    delete_session(conn, :fingers)
    if params["fingers"] === answer do
      ...
    end
  end
```
3. Add to your routes
```elixir
get "/test/finger.jpg", TestController, :finger
```
4. Add to your template for `test` method
```elixir
...
<img src="<%= Routes.test_path(@conn, :finger) %>" />
<input type="number" name="fingers" placeholder="Please tell me how many fingers are shown in each hand" required="true" />
...
```
5. Verify for the answer in form submission with the `verify` like an example.

# Contribution to the library

Please fork and make necessary changes, raise a pull request.

# Contribution to the picture stack

More the merrier! 
- Fork the project
- Please take a _SQUARE_ picture of your hand holding some fingers up - respectfully 
- Either facing your palm or back of your hand
- With decent lighting and exposure
- On a mixed background like nature or some furniture with patterns. Please *avoid* clear, flat walls and plain backgrounds.
- Resize to 200x200
- name the picture as `{finger_count}_{YYMMDD}_{github_username}.jpg` ie, if I am showing 2 fingers up, it would be `2_210408_ykurtbas.jpg`
- commit into `assets` folder
- Raise a pull request.

# Bugs or Issues
- Please raise a bug or issue request in the tracker

