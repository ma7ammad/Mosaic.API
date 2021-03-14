using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Mosaic.IdP.Migrations.IdentityDb
{
    public partial class InitialIddPUsersDMMigration : Migration
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
                values: new object[] { new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), true, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "6dfef11f-53cf-41aa-bb44-2acc9316ee5f", null, null, null, "AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "d860efca-22d9-47fd-8249-791ba61b07c7", "Frank" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Active", "BirthDate", "ConcurrencyStamp", "Email", "FistName", "LastName", "Password", "SecurityCode", "SecurityCodeExpirationDate", "Subject", "UserName" },
                values: new object[] { new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), true, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "18290643-a5e1-43ca-923d-d61fa01ffe95", null, null, null, "AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "b7539694-97e7-4dfe-84da-b4256e1ff5c7", "Claire" });

            migrationBuilder.InsertData(
                table: "UserClaims",
                columns: new[] { "Id", "ConcurrencyStamp", "Type", "UserId", "Value" },
                values: new object[,]
                {
                    { new Guid("15ed2948-e64d-4ade-b84d-85e69f892198"), "0148ba70-1678-4b8b-9457-0fa966602373", "given_name", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Frank" },
                    { new Guid("78799e02-26cf-4b2c-be31-1a09501fc6e2"), "531dff28-5d13-43bc-9c7b-53014013b6e4", "family_name", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Underwood" },
                    { new Guid("743e0896-4c6f-4eb4-a7e1-670452267a5c"), "0a4497f3-8e0a-4999-8e60-e0d3885fe617", "email", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "frank@someprovider.com" },
                    { new Guid("42e3b0e9-3f3d-45a4-8cd9-ed390c1a1607"), "fb8de850-9c3d-4803-8257-3c4dd1a6ba3b", "address", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Main Road 1" },
                    { new Guid("ed12068b-f945-4f14-9a30-fe9f4367f559"), "c2440533-c58e-4ce4-a6d6-0e99fd53d3b2", "role", new Guid("13229d33-99e0-41b3-b18d-4f72127e3971"), "Admin" },
                    { new Guid("a54c86c4-4a9f-46c0-a97f-646d4c1ead29"), "abf5cddf-4e36-42ac-b586-77c147a50ae2", "given_name", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Claire" },
                    { new Guid("0985215b-19c9-4c69-afea-72c5d67ad468"), "a0dc13e8-c323-438b-9e81-39aaa2c2a258", "family_name", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Underwood" },
                    { new Guid("ccd86630-a20a-4d86-bf69-90e250fcaa61"), "eebf676a-b83b-4bd1-94f1-5dfa6f6f3c04", "email", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "claire@someprovider.com" },
                    { new Guid("62213034-b83f-4f84-ac88-c753f0e0e756"), "f12480ee-8865-4df9-986a-11003b9e5647", "address", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "Big Street 2" },
                    { new Guid("672fea9a-d33e-4b1f-8c21-685d6922929b"), "b9862322-c0f8-4397-a9cf-d7a09273beb8", "role", new Guid("96053525-f4a5-47ee-855e-0ea77fa6c55a"), "User" }
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
