//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MovieWebSite.DataService
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblImage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblImage()
        {
            this.tblActors = new HashSet<tblActor>();
            this.tblMovies = new HashSet<tblMovy>();
        }
    
        public decimal ImageId { get; set; }
        public string ImagePath { get; set; }
        public string ImageTitle { get; set; }
        public System.DateTimeOffset CreatedDateTime { get; set; }
        public System.DateTimeOffset LastModifedDateTime { get; set; }
        public bool IsDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblActor> tblActors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblMovy> tblMovies { get; set; }
    }
}