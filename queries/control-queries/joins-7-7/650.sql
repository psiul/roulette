select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 194 and i.i_hash <= 527 and cd.cd_hash >= 74 and cd.cd_hash <= 824 and a.ca_hash >= 14 and a.ca_hash <= 414
;