module Form.Wrapper.Fieldset exposing (..)

import Html.App as Html
import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (class, for, id, type')
--import Html.Events exposing (onInput)

--import Form.Input
import Form.Input.Text
import Form.Input.Number


type alias Model =
  { name : String
  , textInputs : List ( ID, Form.Input.Text.Model )
  , numberInputs : List ( ID, Form.Input.Number.Model )
  }


type alias ID =
  String


initialModel : Model
initialModel =
  { name = "defaultFieldsetName"
  , textInputs =
      [ ( "someTextField"
        , { name = "someTextField", value = "Some initial value" }
        )
      , ( "someAnotherTextField"
        , { name = "someAnotherTextField", value = "Some another initial value" }
        )
      ]
  , numberInputs =
      [ ( "someNumberField"
        , { name = "someNumberField", value = 123 }
        )
      , ( "someAnotherNumberField"
        , { name = "someAnotherNumberField", value = 456 }
        )
      ]
  }


type Msg
  = InputTextMsg ID Form.Input.Text.Msg
  | InputNumberMsg ID Form.Input.Number.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    InputTextMsg id subMsg ->
      let
        updateInput =
          \( subId, subModel ) ->
            if subId == id then
              ( id, Form.Input.Text.update subMsg subModel )
            else
              ( id, subModel )
      in
        { model | textInputs = List.map updateInput model.textInputs }

    InputNumberMsg id subMsg ->
      let
        updateInput =
          \( subId, subModel ) ->
            if subId == id then
              ( id, Form.Input.Number.update subMsg subModel )
            else
              ( id, subModel )
      in
        { model | numberInputs = List.map updateInput model.numberInputs }



view : Model -> Html Msg
view model =
  div []
      [ label [ for model.name ] [ text model.name ]
      , div [] <|
        (List.map viewTextInputs model.textInputs) ++
        (List.map viewNumberInputs model.numberInputs)
      ]


viewTextInputs : ( ID, Form.Input.Text.Model ) -> Html Msg
viewTextInputs =
  \( id, model ) ->
    Html.map (InputTextMsg id) (Form.Input.Text.view model)


viewNumberInputs : ( ID, Form.Input.Number.Model ) -> Html Msg
viewNumberInputs =
  \( id, model ) ->
    Html.map (InputNumberMsg id) (Form.Input.Number.view model)
