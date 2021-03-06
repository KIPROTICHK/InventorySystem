//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InventorySystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.productDetails = new HashSet<productDetail>();
        }
    
        public int pid { get; set; }
        [Required(ErrorMessage = "Sub-Category Name is required")]
        [DisplayName("Sub-Category")]
        public int subCategoryID { get; set; }
        [Required(ErrorMessage = "Product Name is required")]
        [DisplayName("Product Name")]
        public string name { get; set; }
        [Required(ErrorMessage = "Description is required")]
        [DisplayName("Description")]
        public string description { get; set; }
    
        public virtual subCategory subCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<productDetail> productDetails { get; set; }
    }
}
