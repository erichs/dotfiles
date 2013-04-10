trails ()
{
    about 'load rails test environment'
    param '*: optional arguments to rails command'
    example '$ trails console'
    group 'ruby'

    RAILS_ENV=test rails $@
}
