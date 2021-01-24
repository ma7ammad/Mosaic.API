using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Mosaic.IdP.Migrations
{
    public partial class IniTialUserDBMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Subject = table.Column<string>(maxLength: 200, nullable: false),
                    UserName = table.Column<string>(maxLength: 15, nullable: false),
                    Password = table.Column<string>(nullable: false),
                    FistName = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    SecurityCode = table.Column<string>(maxLength: 200, nullable: true),
                    SecurityCodeExpirationDate = table.Column<DateTime>(nullable: false),
                    BirthDate = table.Column<DateTime>(nullable: false),
                    Active = table.Column<bool>(nullable: false),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserClaims",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 250, nullable: false),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    UserId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserClaims_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Active", "BirthDate", "ConcurrencyStamp", "Email", "FistName", "LastName", "Password", "SecurityCode", "SecurityCodeExpirationDate", "Subject", "UserName" },
                values: new object[] { new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), true, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "311250cb-2451-43c0-9e47-1d47f09ec295", null, null, null, "AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "d860efca-22d9-47fd-8249-791ba61b07c7", "Frank" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Active", "BirthDate", "ConcurrencyStamp", "Email", "FistName", "LastName", "Password", "SecurityCode", "SecurityCodeExpirationDate", "Subject", "UserName" },
                values: new object[] { new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), true, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "1fc46b51-ed5d-4e9c-878d-eb2735636836", null, null, null, "AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "b7539694-97e7-4dfe-84da-b4256e1ff5c7", "Claire" });

            migrationBuilder.InsertData(
                table: "UserClaims",
                columns: new[] { "Id", "ConcurrencyStamp", "Type", "UserId", "Value" },
                values: new object[,]
                {
                    { new Guid("f3889757-10d6-4e70-ada2-4441736a6c14"), "7f5e79e7-ca08-4be3-a5dd-b1ae742a7ad2", "given_name", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Frank" },
                    { new Guid("b74d8056-7fe3-4509-8014-ddcbc3e60cd6"), "873f531f-91d8-41cd-81ea-c590c341692d", "family_name", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Underwood" },
                    { new Guid("94dcbce3-ac26-4e8b-8ffc-8a009b5cb9fd"), "91cdb24b-8a7c-433d-abd0-7b86e5377646", "email", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "frank@someprovider.com" },
                    { new Guid("cf3120a7-3b84-4a43-94b7-8d0b7a6be2cb"), "8ff86915-f576-4da2-978f-b7a7392c1c59", "address", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Main Road 1" },
                    { new Guid("569015b7-7878-47d3-bcf5-8083f5086640"), "3904acdb-3e39-4f73-b558-b22179e7145f", "role", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Admin" },
                    { new Guid("dda5c6bc-06db-4b9b-8526-75c77af78d56"), "b7fe5328-9dc3-4bf9-9385-b54327fde4f3", "given_name", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Claire" },
                    { new Guid("997b81c6-0b29-44f2-8312-54e3779086dd"), "b471ce07-d126-4753-8ff7-04c10ef6da3d", "family_name", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Underwood" },
                    { new Guid("f03a01b3-973c-444d-bacf-a7944f2f7716"), "07af7f5c-e786-4032-90c0-1f85c06c77b8", "email", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "claire@someprovider.com" },
                    { new Guid("813506fd-4848-4ffd-9f2c-ac4fe5ddc4dd"), "5318139a-7528-406a-b0d4-1e011265698f", "address", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Big Street 2" },
                    { new Guid("7be58483-42e4-444e-a832-b10dc0c74d9a"), "6d4c8aa2-4d0c-438c-8d1d-deb279dd0765", "role", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "User" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserClaims_UserId",
                table: "UserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_Subject",
                table: "Users",
                column: "Subject",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_UserName",
                table: "Users",
                column: "UserName",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserClaims");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
