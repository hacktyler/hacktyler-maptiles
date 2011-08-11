#!/usr/bin/env python

from englewood import DotDensityPlotter 

def get_data(feature):
    return {
        'hisp': feature.GetFieldAsInteger(feature.GetFieldIndex('hisp')),
        'nhblack': feature.GetFieldAsInteger(feature.GetFieldIndex('nhblack')),
        'nhasian': feature.GetFieldAsInteger(feature.GetFieldIndex('nhasian')),
        'nhwhite': feature.GetFieldAsInteger(feature.GetFieldIndex('nhwhite'))
    }

dots = DotDensityPlotter('PG:dbname=tylercensus host=localhost', 'race_shapes', 'PostgreSQL', 'PG:dbname=tylercensus host=localhost', 'race_dots', get_data, 1)
dots.plot()
