module Form.Input.Text exposing (..)

import Html exposing (Html, text)


type alias Text = Model

type alias Model =
  { name : String
  , value : String
  }

initialModel : Model
initialModel =
  { name = "defaultName"
  , value = "default value"
  }


type Msg =
  SetValue String


update : Msg -> Model -> Model
update msg model =
  case msg of
    SetValue newVal ->
      { model | value = newVal }


view : Model -> Html Msg
view model =
  text <| "Text component. view model debug: " ++ (toString model) 
