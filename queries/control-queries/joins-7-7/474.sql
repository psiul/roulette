select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 276 and i.i_hash <= 609 and d.d_hash >= 75 and d.d_hash <= 825 and cd.cd_hash >= 231 and cd.cd_hash <= 631
;
