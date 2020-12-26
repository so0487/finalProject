var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editId = $('#edit-id');
var editTitle = $('#edit-title');
var schedule_category_no = $('#schedule_category_no');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');




/* ****************
 *  새로운 일정 생성H
 * ************** */
	function newEvent(start, end, eventType) {
    $("#contextMenu").hide(); //메뉴 숨김
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');
    
    
    modalTitle.html('새로운 일정');
//    editType.val(eventType).prop('selected', true);
//    $(document).ready(function () {
    	editval= $('select[name="edit-type"]').attr('data-type');
    	$('select[name="edit-type"] option[value=' + editval + ']').attr('selected', 'selected');
//    	});	
    editId.val('');
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    if(eventType=="상담"){
    	$("#edit-type option:eq(5)").prop('selected', true);
    	document.getElementById("edit-color").style.color = "#9775fa";
    	$('#edit-color').val("#9775fa");
    	$('#edit-color').attr('disabled','disabled');
    }else if(eventType=="개인 용무"){
    	$("#edit-type option:eq(6)").prop('selected', true);
    	document.getElementById("edit-color").style.color = "#63e6be";
    	$('#edit-color').val("#63e6be");
    	$('#edit-color').attr('disabled','disabled');
    }
    
    editType.attr('disabled','disabled');
    
//    $("#edit-type option:eq(4)").prop('selected', true);
    


    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
//    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
    	
        var eventData = {
        	id: editId.val(),
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            type: editType.val(),
            description: editDesc.val(),
            schedule_category_no: schedule_category_no.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
        	var dates = new Date();
        	alert(dates);
            alert('일정명은 필수입니다.');
            return false;
        }
        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
//            DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }
        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "",
            data: {
                //.....
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
//                $('#calendar').fullCalendar('removeEvents');
//                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};