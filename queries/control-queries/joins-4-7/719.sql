select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 41 and ss.ss_hash <= 441 and cd.cd_hash >= 518 and cd.cd_hash <= 851 and i.i_hash >= 118 and i.i_hash <= 868
;
