buf ()
{
    about 'back up file with timestamp'
    param '1: filename'
    example '$ buf /etc/smb.conf'
    group 'file'

    local filename=$1
    local filetime=$(date +%Y%m%d_%H%M%S)
    cp ${filename} ${filename}_${filetime}
}
