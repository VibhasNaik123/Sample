﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace MoviesWebSite.Model
{
    public class Actor
    {
        public Decimal _Id { get; set; }
        [DisplayName("Name")]
        [Required(ErrorMessage = "Name is required")]
        public string _Name { get; set; }

        [DisplayName("Gender")]
        public Gender _Gender { get; set; }

        [Required]
        public byte _SelectedGender { get; set; }



        [DisplayName("Date of Birth")]
        [Required(ErrorMessage = "Date of birth is required")]
        public DateTime _DateOfBirth { get; set; }

        [DisplayName("Bio")]
        [Required(ErrorMessage = "Bio is required")]
        public string _Bio { get; set; }

        public Image _Image { get; set; }




        public Actor()
        {
            _Gender = new Gender();
            _Image = new Image();
        }
    }
}
