##! This provides an interface for sending Notices to a Mattermost endpoint

#@load base/frameworks/notice
#@load base/frameworks/input
#module Notice;
#
#export {
#    redef enum Action += {
#        ACTION_MATTERMOST,
#    };
#
#    redef default_suppression_interval = 0secs;
#    global mattermost_payload: function(n: Notice::Info): string;
#    global mattermost_send_notice: function(message: string);
#}
#
#function mattermost_send_notice(message: string)
#    {
#
#    when ( local result = Exec::run([$cmd=fmt("/opt/pocketsoc-ng/bin/notifier.sh %s", safe_shell_quote(message))]) )
#                {
#                if ( result$exit_code != 0 )
#                        {
#                        Reporter::warning(fmt("Mattermost message did not send (%s).", message));
#                        return;
#                        }
#                }
#
#    }
#
#function mattermost_payload(n: Notice::Info): string
#    {
#    local message = fmt("%s: %s", n$note, n$msg);
#    if ( n?$sub )
#        {
#        message = string_cat(message,
#            fmt(" (%s)", n$sub));
#        }
#    if ( n?$id )
#        {
#        message = string_cat(message, ", Connection: ",
#            fmt("%s", n$id$orig_h), ":", fmt("%d", n$id$orig_p), " -> ",
#            fmt("%s", n$id$resp_h), ":", fmt("%d", n$id$resp_p));
#        if ( n?$uid )
#            message = string_cat(message, ", Connection uid: ", n$uid);
#        }
#    else if ( n?$src )
#        message = string_cat(message, fmt(", Source: %s", n$src));
#
#    return message;
#    }
#
#hook notice(n: Notice::Info)
#    {
#        if ( ACTION_MATTERMOST in n$actions )
#            mattermost_send_notice(mattermost_payload(n));
#    }
