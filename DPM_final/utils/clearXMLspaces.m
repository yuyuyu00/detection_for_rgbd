function xml = clearXMLspaces( xml )
% Auxiliary function that ensures that xml files with annotation will be in
% a format readable by VOCdevkit. 
% ASSUMPTION: There are no texts inside a tag that have only white space <tag>...(here at least one alpharithmetic)</tag>
%
%
% Copyright (C) 2014 Grigorios Chrysos
% available under the terms of the Apache License, Version 2.0

%% getting rid of empty spaces between tags
ids=strfind(xml,'<');
closing_ids=strfind(xml,'>');closing_ids=closing_ids(1:end-1); %ignore the last closing one
for i=size(ids,2):-1:2 %the first one is not interesting, reverse order
    if min(isstrprop(xml(closing_ids(i-1)+1:ids(i)-1), 'wspace'))
        xml2=[xml(1:closing_ids(i-1)) xml(ids(i):end)];
        xml=xml2;
        clear xml2;
    end
end

%% root -> annotation
xml=strrep(xml,'<root>','<annotation>');
xml=strrep(xml,'</root>','</annotation>');

end

