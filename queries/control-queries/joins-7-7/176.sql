select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 2 and hd.hd_hash <= 335 and cd.cd_hash >= 38 and cd.cd_hash <= 788 and i.i_hash >= 194 and i.i_hash <= 594
;
