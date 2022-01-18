select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 87 and c.c_hash <= 837 and hd.hd_hash >= 629 and hd.hd_hash <= 962 and d.d_hash >= 414 and d.d_hash <= 814
;
