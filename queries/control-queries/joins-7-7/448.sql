select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 245 and i.i_hash <= 995 and hd.hd_hash >= 263 and hd.hd_hash <= 663 and c.c_hash >= 1 and c.c_hash <= 334
;
