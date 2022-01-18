select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and a.ca_hash >= 84 and a.ca_hash <= 834 and cd.cd_hash >= 573 and cd.cd_hash <= 906 and hd.hd_hash >= 501 and hd.hd_hash <= 901
;
