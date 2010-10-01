# Pivotxt lets you easily create stories in Pivotal Tracker from a simple text file.

Sure, there's [slurper](http://github.com/hashrocket/slurper) but I didn't like slurper's file format; it's too YAML-y.  
Hint: if you need a vim plugin to help you write your stories file, it's probably overly-complicated.

So, I drafted a simple file format that I'd like to use, I wrote a grammar in Treetop to parse that format.  Pivotxt is the result.  Hopefully you'll find it as useful as I do. 

## Configuration & Usage
1.  Stick your appropriate values into pivotxt_config.yml
2.  Use bin/pivotxt like this: pivotxt stories.pivotxt
3.  You're done.


## Sample stories.pivotxt file format
<pre>
LabelOne LabelTwo
  - Features start with -'s as you can see (an inline description for this feature would go here)

  - Features can have multi-line descriptions too, like this one
      This is the first description line for the above feature.
      Here is another line.
      And yet another line here.

  - All stories nested under a line of labels will have those labels applied to them.
      In this case, we'll end up with 3 features and 2 chores, 
      all with the 'LabelOne' and 'LabelTwo' labels assigned to them
      because these are all nested under the 'LabelOne LabelTwo' line above.

  [] Chores look like check boxes (and they can have inline descriptions too)

  [] Chores can also have multi-line descriptions
      Here's a multiline description for the above chore.
      This is a second line of description.


AnotherLabel
  - Obviously, you can have as many labeled groups of stories as you want.
      This feature belongs to a new label group called 'AnotherLabel' 
      and it will be the only story created for the 'AnotherLabel' label.
</pre>


## Copyright

MIT Licensed.  Copyright (c) 2010 Gabe Hollombe. See LICENSE for details.
