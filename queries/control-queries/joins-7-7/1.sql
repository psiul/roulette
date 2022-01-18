select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 98 and ss.ss_hash <= 848 and i.i_hash >= 196 and i.i_hash <= 529 and c.c_hash >= 533 and c.c_hash <= 933
;
