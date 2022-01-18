select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 175 and c.c_hash <= 575 and cd.cd_hash >= 209 and cd.cd_hash <= 542 and i.i_hash >= 29 and i.i_hash <= 779
;
