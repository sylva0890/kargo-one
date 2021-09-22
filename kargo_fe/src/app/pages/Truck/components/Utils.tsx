import * as React from 'react';

export function classNames(...classes) {
  return classes.filter(Boolean).join(' ');
}
