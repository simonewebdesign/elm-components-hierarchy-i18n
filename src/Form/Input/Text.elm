module Form.Input.Text exposing (..)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (class, for, id, type')
import Html.Events exposing (onInput)
import Translation exposing (Language(..), Key(WelcomeBack), translate)


type alias Model =
  { name : String
  , value : String
  , lang : Language
  }


initialModel : Model
initialModel =
  { name = "defaultName"
  , value = "default value"
  , lang = English
  }


type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newValue ->
      { model | value = newValue }


view : Model -> Html Msg
view model =
  div []
      [ label [ for model.name ] [ text <| translate model.lang (WelcomeBack {name = "John"}) ]
      , input [ type' "text"
              , id model.name
              , onInput Change
              ] []
      ]
