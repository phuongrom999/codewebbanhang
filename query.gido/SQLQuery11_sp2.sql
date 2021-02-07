CREATE PROC sp_them_ncc (
	@ten NVARCHAR(100),
	@diachi NVARCHAR(255),
	@email NVARCHAR(255),
	@sodienthoai VARCHAR(10),
	@fax NVARCHAR(50)
)
AS
BEGIN
	DECLARE @ncc_id VARCHAR(100)
	SET @ncc_id = (SELECT MAX(MaNCC) FROM NhaCungCap)

	DECLARE @so_ncc INT

	IF @ncc_id IS NULL
		SET @so_ncc = 1
	ELSE
		SET @so_ncc = CAST(SUBSTRING(@ncc_id, 4, LEN(@ncc_id)) AS INT) + 1
	
	IF @so_ncc < 10
	BEGIN
		SET @ncc_id='NCC000' + CAST(@so_ncc AS CHAR(1))
	END
	ELSE
	IF @so_ncc < 100
	BEGIN
		SET @ncc_id='NCC00' + CAST(@so_ncc AS CHAR(2))
		
	END
	
	
	INSERT INTO NhaCungCap VALUES(@ncc_id, @ten, @diachi, @email, @sodienthoai, @fax)
	
	SELECT  @ncc_id
END
GO

CREATE PROC sp_them_pn (
	@mancc NVARCHAR(100),
	@ngaynhap DATETIME,
	@daxoa BIT
	
)
AS
BEGIN
	DECLARE @pn_id VARCHAR(100)
	SET @pn_id = (SELECT MAX(MaPN) FROM PhieuNhap)

	DECLARE @so_pn INT

	IF @pn_id IS NULL
		SET @so_pn = 1
	ELSE
		SET @so_pn = CAST(SUBSTRING(@pn_id, 3, LEN(@pn_id)) AS INT) + 1
	
	IF @so_pn < 10
	BEGIN
		SET @pn_id='PN000' + CAST(@so_pn AS CHAR(1))
	END
	ELSE
	IF @so_pn < 100
	BEGIN
		SET @pn_id='PN00' + CAST(@so_pn AS CHAR(2))
		
	END
	
	
	INSERT INTO PhieuNhap VALUES(@pn_id, @mancc, @ngaynhap, @daxoa)
	
	SELECT  @pn_id
END
GO

CREATE PROC sp_them_ltv (
	@ten NVARCHAR(50),
	@uudai INT
	
)
AS
BEGIN
	DECLARE @ltv_id VARCHAR(100)
	SET @ltv_id = (SELECT MAX(MaLoaiTV) FROM LoaiThanhVien)

	DECLARE @so_ltv INT

	IF @ltv_id IS NULL
		SET @so_ltv = 1
	ELSE
		SET @so_ltv = CAST(SUBSTRING(@ltv_id, 4, LEN(@ltv_id)) AS INT) + 1
	
	IF @so_ltv < 10
	BEGIN
		SET @ltv_id='LTV000' + CAST(@so_ltv AS CHAR(1))
	END
	ELSE
	IF @so_ltv < 100
	BEGIN
		SET @ltv_id='LTV00' + CAST(@so_ltv AS CHAR(2))
		
	END
	
	
	INSERT INTO LoaiThanhVien VALUES(@ltv_id, @ten, @uudai)
	
	SELECT  @ltv_id
END
GO

CREATE PROC sp_them_tv (
	@taikhoan NVARCHAR(100),
	@matkhau NVARCHAR(100),
	@ten NVARCHAR(100),
	@diachi NVARCHAR(255),
	@email NVARCHAR(255),
	@sodienthoai VARCHAR(10),
	@cauhoi NVARCHAR(MAX),
	@cautraloi NVARCHAR(MAX),
	@ma_ltv VARCHAR(100)
	
)
AS
BEGIN
	DECLARE @tv_id VARCHAR(100)
	SET @tv_id = (SELECT MAX(MaThanhVien) FROM ThanhVien)

	DECLARE @so_tv INT

	IF @tv_id IS NULL
		SET @so_tv = 1
	ELSE
		SET @so_tv = CAST(SUBSTRING(@tv_id, 3, LEN(@tv_id)) AS INT) + 1
	
	IF @so_tv < 10
	BEGIN
		SET @tv_id='TV000' + CAST(@so_tv AS CHAR(1))
	END
	ELSE
	IF @so_tv < 100
	BEGIN
		SET @tv_id='TV00' + CAST(@so_tv AS CHAR(2))
		
	END
	
	
	INSERT INTO ThanhVien VALUES(@tv_id, @taikhoan, @matkhau, @ten, @diachi, @email, @sodienthoai, @cauhoi, @cautraloi, @ma_ltv )
	
	SELECT  @tv_id
END
GO

CREATE PROC sp_them_kh (
	@ten NVARCHAR(100),
	@diachi NVARCHAR(255),
	@email NVARCHAR(255),
	@sodienthoai VARCHAR(10),
	@ma_tv VARCHAR(100)
	
)
AS
BEGIN
	DECLARE @kh_id VARCHAR(100)
	SET @kh_id = (SELECT MAX(MaKH) FROM KhachHang)

	DECLARE @so_kh INT

	IF @kh_id IS NULL
		SET @so_kh = 1
	ELSE
		SET @so_kh = CAST(SUBSTRING(@kh_id, 3, LEN(@kh_id)) AS INT) + 1
	
	IF @so_kh < 10
	BEGIN
		SET @kh_id='KH000' + CAST(@so_kh AS CHAR(1))
	END
	ELSE
	IF @so_kh < 100
	BEGIN
		SET @kh_id='KH00' + CAST(@so_kh AS CHAR(2))
		
	END
	
	
	INSERT INTO KhachHang VALUES(@kh_id, @ten, @diachi, @email, @sodienthoai, @ma_tv )
	
	SELECT  @kh_id
END
GO

CREATE PROC sp_them_lsp (
	@ten NVARCHAR(100),
	@icon NVARCHAR(255),
	@bidanh NVARCHAR(50)
	
)
AS
BEGIN
	DECLARE @lsp_id VARCHAR(100)
	SET @lsp_id = (SELECT MAX(MaLoaiSP) FROM LoaiSanPham)

	DECLARE @so_lsp INT

	IF @lsp_id IS NULL
		SET @so_lsp = 1
	ELSE
		SET @so_lsp = CAST(SUBSTRING(@lsp_id, 4, LEN(@lsp_id)) AS INT) + 1
	
	IF @so_lsp < 10
	BEGIN
		SET @lsp_id='LSP000' + CAST(@so_lsp AS CHAR(1))
	END
	ELSE
	IF @so_lsp < 100
	BEGIN
		SET @lsp_id='LSP00' + CAST(@so_lsp AS CHAR(2))
		
	END
	
	
	INSERT INTO LoaiSanPham VALUES(@lsp_id, @ten, @icon, @bidanh)
	
	SELECT  @lsp_id
END
GO

CREATE PROC sp_them_sp(
	@ten  NVARCHAR(255),
	@dongia DECIMAL(18,0),
	@ngaycapnhat DATETIME,
	@cauhinh NVARCHAR(MAX),
	@mota NVARCHAR(MAX),
	@hinhanh NVARCHAR(MAX),
	@soluongton INT,
	@luotxem INT,
	@luotbinhchon INT,
	@luotbinhluan INT,
	@solanmua INT,
	@moi INT,
	@mancc VARCHAR(100),
	@mansx VARCHAR(100),
	@maloaisp VARCHAR(100),
	@machatlieu INT,
	@mamausac INT,
	@masize INT,
	@daxoa BIT
	)
	AS
BEGIN
	DECLARE @sp_id VARCHAR(100)
	SET @sp_id = (SELECT MAX(MaSP) FROM SanPham)

	DECLARE @so_sp INT

	IF @sp_id IS NULL
		SET @so_sp = 1
	ELSE
		SET @so_sp = CAST(SUBSTRING(@sp_id, 3, LEN(@sp_id)) AS INT) + 1
	
	IF @so_sp < 10
	BEGIN
		SET @sp_id='SP000' + CAST(@so_sp AS CHAR(1))
	END
	ELSE
	IF @so_sp < 100
	BEGIN
		SET @sp_id='SP00' + CAST(@so_sp AS CHAR(2))
		
	END
	
	
	INSERT INTO SanPham VALUES(@sp_id, @ten, @dongia, @ngaycapnhat, @cauhinh, @mota, @hinhanh, @soluongton,
								@luotxem, @luotbinhchon, @luotbinhluan, @solanmua, @moi, @mancc,
								@mansx, @maloaisp, @machatlieu, @mamausac, @masize, @daxoa)
	
	SELECT  @sp_id
END
GO


exec sp_them_ncc N'Nhà cung cấp 2', N'Tam An', N'ncc2@gmail.com', 0123456798, null;

exec sp_them_pn NCC0002, '2021/01/20',false;