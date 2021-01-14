
function list_remote_hosts
  for entry in (grep "Host\ " ~/.ssh/config)
    echo $entry | awk 'FS="\ " {print $2}'
  end
end
