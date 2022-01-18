select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 192 and ss.ss_hash <= 592 and cd.cd_hash >= 64 and cd.cd_hash <= 814 and i.i_hash >= 657 and i.i_hash <= 990
;
