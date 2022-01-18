select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 259 and hd.hd_hash <= 659 and a.ca_hash >= 213 and a.ca_hash <= 963 and cd.cd_hash >= 530 and cd.cd_hash <= 863
;
