module Expect.Extra exposing (just, err, ok)

import Result exposing (Result)
import Expect exposing (Expectation, fail, pass)


just : Maybe a -> Expectation
just value =
    case value of
        Just _ ->
            pass

        Nothing ->
            fail "expected a (Just _) value, got Nothing"


err : Result a b -> Expectation
err result =
    case result of
        Ok _ ->
            fail ("expected an (Err _) result, got " ++ (toString result))

        Err _ ->
            pass


ok : Result a b -> Expectation
ok result =
    case result of
        Ok _ ->
            pass

        Err _ ->
            fail ("expected an (Ok _) result, got " ++ (toString result))
