select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 149 and i.i_hash <= 899 and hd.hd_hash >= 75 and hd.hd_hash <= 475 and cd.cd_hash >= 120 and cd.cd_hash <= 453
;
