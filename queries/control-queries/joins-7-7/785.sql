select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 221 and ss.ss_hash <= 971 and i.i_hash >= 2 and i.i_hash <= 335 and hd.hd_hash >= 486 and hd.hd_hash <= 886
;
