select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 60 and i.i_hash <= 460 and hd.hd_hash >= 188 and hd.hd_hash <= 938 and cd.cd_hash >= 646 and cd.cd_hash <= 979
;
