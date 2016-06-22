module Form.Input.Text exposing (..)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (class, for, id, type')
import Html.Events exposing (onInput)
import Translation exposing (TranslationId(Login))


type alias Model =
  { name : String
  , value : String
  , translate : TranslationId -> String
  }


initialModel : Model
initialModel =
  { name = "defaultName"
  , value = "default value"
  , translate = \_ -> ""
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
      [ label [ for model.name ] [ text <| model.translate Login ]
      , input [ type' "text"
              , id model.name
              , onInput Change
              ] []
      ]
