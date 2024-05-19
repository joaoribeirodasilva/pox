package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthUserGroupsList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth user groups list"})
	return nil
}

func (o *Service) AuthUserGroupsGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth user groups get"})
	return nil
}

func (o *Service) AuthUserGroupsCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth user groups create"})
	return nil
}

func (o *Service) AuthUserGroupsUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth user groups update"})
	return nil
}

func (o *Service) AuthUserGroupsDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth user groups delete"})
	return nil
}
