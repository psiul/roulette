select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and a.ca_hash >= 68 and a.ca_hash <= 818 and hd.hd_hash >= 4 and hd.hd_hash <= 404 and i.i_hash >= 86 and i.i_hash <= 419
;
