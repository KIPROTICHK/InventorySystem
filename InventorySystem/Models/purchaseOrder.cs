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
    
    public partial class purchaseOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public purchaseOrder()
        {
            this.purchaseOrderLines = new HashSet<purchaseOrderLine>();
        }
    
        public int poID { get; set; }
        public string supplierNames { get; set; }
        public string Telno { get; set; }
        public string description { get; set; }
        public byte[] date { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<purchaseOrderLine> purchaseOrderLines { get; set; }
    }
}
