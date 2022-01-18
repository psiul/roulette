select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 256 and ss.ss_hash <= 656 and i.i_hash >= 480 and i.i_hash <= 813 and cd.cd_hash >= 26 and cd.cd_hash <= 776
;
