show_poros ()
{
    about 'determines which Ruby models are Plain Old Ruby Objects'
    about '    requires PWD to be the app/models directory!'
    example '$ cd app/models'
    example '$ show_poros'
    group 'ruby'

    for model in *;
    do
        [ -z "$(grep ActiveRecord $model)" ] && echo "model $model is a PORO.";
    done
}

