EXEC procedure_param_default_ref_p 'source'
GO

EXEC procedure_param_default_ref_p 'source', 'explicit'
GO

EXEC procedure_param_default_ref_p @a = 'named'
GO

EXEC procedure_param_default_ref_p @b = 'bee', @a = 'aye'
GO

EXEC procedure_param_default_ref_p 'source', NULL
GO
