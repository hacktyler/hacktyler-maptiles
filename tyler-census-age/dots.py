#!/usr/bin/env python

from englewood import DotDensityPlotter 

def get_data(feature):
    return {
        'under18': feature.GetFieldAsInteger(feature.GetFieldIndex('under18')),
        'under25': feature.GetFieldAsInteger(feature.GetFieldIndex('under25')),
        'under40': feature.GetFieldAsInteger(feature.GetFieldIndex('under40')),
        'under65': feature.GetFieldAsInteger(feature.GetFieldIndex('under65')),
        'gte65': feature.GetFieldAsInteger(feature.GetFieldIndex('gte65')),
    }

dots = DotDensityPlotter('PG:dbname=tylercensus host=localhost', 'age_shapes', 'PostgreSQL', 'PG:dbname=tylercensus host=localhost', 'age_dots', get_data, 1)
dots.plot()

