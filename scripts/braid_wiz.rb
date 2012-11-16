# argument value is required
if $args.empty?
  echo "Braid what?"
  exit!
end

# executed in the end of the script
# or if script is aborted by the user
def finally_do
  echo "*** Ending in #{get_match_rt.to_s} seconds. ***"

  right = Wield::right_noun
  unless right.empty?
    put "put my #{right} in bucket"
  end

  left = Wield::left_noun
  unless left.empty?
    put "put my #{left} in bucket"
  end
end

label(:start){
  put "exp mech"
  match = { :end => ["% mind lock", "% nearly locked"],
            :forage => ["EXP HELP"] }
  match_wait_goto match
}

label(:forage) {
  pause 0.5
  put "forage #{$args.join(" ")}"
  match = { :braid => ["You manage to find"] }
  match_wait_goto match
}

label(:braid) {
  put "braid my #{$args.join(" ")}"
  match = { :start => ["need to have more material"],
            :end => ["Roundtime: 8", "Roundtime: 9", "as long as you can make it", "than wasted effort"],
            :braid => ["Roundtime"] }
  match_wait_goto match
}

label(:end) {

}