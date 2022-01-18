select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 318 and ss.ss_hash <= 651 and cd.cd_hash >= 334 and cd.cd_hash <= 734 and i.i_hash >= 29 and i.i_hash <= 779
;
