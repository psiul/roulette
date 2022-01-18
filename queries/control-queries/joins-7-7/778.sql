select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 365 and ss.ss_hash <= 698 and d.d_hash >= 586 and d.d_hash <= 986 and cd.cd_hash >= 176 and cd.cd_hash <= 926
;
