function  tabella(a)
f = figure('Position',[440 500 461 146]);
f.Name='Risultati ottenuti';
f.DockControls='on';

% Create the column and row names in cell arrays 
cnames = {'Jerk Euclideo'};
rnames = {'Esperto Facile','Intermedio Facile','Inesperto Facile','Esperto Difficile','Intermedio Difficile','Inesperto Difficile'};

% Create the uitable
t = uitable(f,'Data',a,...
            'ColumnName',cnames,... 
            'RowName',rnames);
            
% Set width and height
t.Position(3) = t.Extent(3);
t.Position(4) = t.Extent(4);
%clearvars -except dati jerk;


end

