select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 78 and ss.ss_hash <= 828 and cd.cd_hash >= 437 and cd.cd_hash <= 770 and i.i_hash >= 328 and i.i_hash <= 728
;
