select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 93 and c.c_hash <= 843 and hd.hd_hash >= 365 and hd.hd_hash <= 765 and i.i_hash >= 393 and i.i_hash <= 726
;
