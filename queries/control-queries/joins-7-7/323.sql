select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and a.ca_hash >= 13 and a.ca_hash <= 763 and cd.cd_hash >= 579 and cd.cd_hash <= 912 and d.d_hash >= 136 and d.d_hash <= 536
;
