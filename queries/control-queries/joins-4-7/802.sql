select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 474 and ss.ss_hash <= 807 and cd.cd_hash >= 386 and cd.cd_hash <= 786 and i.i_hash >= 60 and i.i_hash <= 810
;
