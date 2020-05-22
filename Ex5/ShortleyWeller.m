function [solution] = ShortleyWeller(vector_field_func, boundary_value_func, num_grid_points)
  A = OperatorAssembler(num_grid_points);
  F = FunctionalAssembler(vector_field_func, boundary_value_func, num_grid_points);
  solution = A\F;