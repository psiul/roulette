select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 193 and ss.ss_hash <= 293 and i.i_hash >= 396 and i.i_hash <= 896 and cd.cd_hash >= 603 and cd.cd_hash <= 803
;
