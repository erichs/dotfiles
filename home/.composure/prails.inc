prails ()
{
    about 'load rails production environment'
    param '*: optional arguments to rails command'
    example '$ prails console'
    group 'ruby'

    RAILS_ENV=production rails $@
}
