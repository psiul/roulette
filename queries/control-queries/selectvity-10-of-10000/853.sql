select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 46 and ss.ss_hash <= 96 and hd.hd_hash >= 615 and hd.hd_hash <= 815 and cd.cd_hash >= 37 and cd.cd_hash <= 137
;
